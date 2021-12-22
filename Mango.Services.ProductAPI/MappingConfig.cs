using AutoMapper;
using Mango.Services.ProductAPI.Models;

namespace Mango.Services.ProductAPI;

public class MappingConfig
{
    public static MapperConfiguration RegisterMap()
    {
        var mappingConfig = new MapperConfiguration(config =>
        {
            config.CreateMap<ProductDto, Product>().ReverseMap();
        });

        return mappingConfig;
    }
}