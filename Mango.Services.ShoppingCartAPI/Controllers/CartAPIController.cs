using Mango.MessageBus;
using Mango.Services.ShoppingCartAPI.Messages;
using Mango.Services.ShoppingCartAPI.Models.Dto;
using Mango.Services.ShoppingCartAPI.Repository;
using Microsoft.AspNetCore.Mvc;

namespace Mango.Services.ShoppingCartAPI.Controllers;

[ApiController]
[Route("api/cart")]
public class CartAPIController : Controller
{
    private readonly ICartRepository _cartRepository;
    private readonly IMessageBus _messageBus;
    protected ResponseDto _response;
    
    public CartAPIController(ICartRepository cartRepository, IMessageBus messageBus)
    {
        _cartRepository = cartRepository;
        _messageBus = messageBus;
        this._response = new ResponseDto();
    }
    
    // GET
    [HttpGet("GetCart/{userId}")]
    public async Task<object> GetCart(string userId)
    {
        try
        {
            CartDto cartDto = await _cartRepository.GetCartByUserId(userId);
            _response.Result = cartDto;

        }
        catch (Exception e)
        {
            _response.IsSuccess = false;
            _response.ErrorMessages = new List<string>() { e.ToString() };
        }
        return _response;
    }
    
    [HttpPost("AddCart")]
    public async Task<object> AddCart(CartDto cartDto)
    {
        try
        {
            CartDto cartDt = await _cartRepository.CreateUpdateCart(cartDto);
            _response.Result = cartDt;

        }
        catch (Exception e)
        {
            _response.IsSuccess = false;
            _response.ErrorMessages = new List<string>() { e.ToString() };
        }
        return _response;
    }
    
    [HttpPost("UpdateCart")]
    public async Task<object> UpdateCart(CartDto cartDto)
    {
        try
        {
            CartDto cartDt = await _cartRepository.CreateUpdateCart(cartDto);
            _response.Result = cartDt;

        }
        catch (Exception e)
        {
            _response.IsSuccess = false;
            _response.ErrorMessages = new List<string>() { e.ToString() };
        }
        return _response;
    }
    
    [HttpPost("RemoveCart")]
    public async Task<object> RemoveCart([FromBody]int cartId)
    {
        try
        {
            bool issuccess = await _cartRepository.RemoveFromCart(cartId);
            _response.Result = issuccess;

        }
        catch (Exception e)
        {
            _response.IsSuccess = false;
            _response.ErrorMessages = new List<string>() { e.ToString() };
        }
        return _response;
    }
    [HttpPost("ApplyCoupon")]
    public async Task<object> ApplyCoupon([FromBody] CartDto cartDto)
    {
        try
        {
            bool issuccess = await _cartRepository.ApplyCoupon(cartDto.CartHeader.UserId,
                    cartDto.CartHeader.CouponCode);
            _response.Result = issuccess;

        }
        catch (Exception e)
        {
            _response.IsSuccess = false;
            _response.ErrorMessages = new List<string>() { e.ToString() };
        }
        return _response;
    }
    [HttpPost("RemoveCoupon")]
    public async Task<object> RemoveCoupon([FromBody]string userId)
    {
        try
        {
            bool issuccess = await _cartRepository.RemoveCoupon(userId);
            _response.Result = issuccess;

        }
        catch (Exception e)
        {
            _response.IsSuccess = false;
            _response.ErrorMessages = new List<string>() { e.ToString() };
        }
        return _response;
    }
    
    [HttpPost("Checkout")]
    public async Task<object> Checkout(CheckoutHeaderDto checkoutHeader)
    {
        try
        {
            CartDto cartDto = await _cartRepository.GetCartByUserId(checkoutHeader.UserId);
            if (cartDto == null)
            {
                return BadRequest();
            }

            checkoutHeader.CartDetails = cartDto.CartDetails;
            //logic to add message to process order.
            await _messageBus.PublishMessage(checkoutHeader, "checkoutmessagetopic");

        }
        catch (Exception e)
        {
            _response.IsSuccess = false;
            _response.ErrorMessages = new List<string>() { e.ToString() };
        }
        return _response;
    }
}