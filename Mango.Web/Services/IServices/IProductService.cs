using Mango.Web.Models;

namespace Mango.Web.Services.IServices;

public interface IProductService: IBaseService
{
    Task<T> GetAllProductsAsync<T>();
    Task<T> GetProductsByIdAsync<T>(int id);
    Task<T> CreateProductsAsync<T>(ProductDto productDto);
    Task<T> UpdateProductsAsync<T>(ProductDto productDto);
    Task<T> DeleteProductsAsync<T>(int id);
}