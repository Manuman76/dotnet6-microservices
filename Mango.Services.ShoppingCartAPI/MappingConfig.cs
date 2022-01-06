using AutoMapper;

namespace Mango.Services.ShoppingCartAPI;

public class MappingConfig
{
    public static MapperConfiguration RegisterMap()
    {
        var mappingConfig = new MapperConfiguration(config =>
        {
            //config.CreateMap<ProductDto, Product>().ReverseMap();
        });

        return mappingConfig;
    }
}