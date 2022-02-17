using System.Text;
using Azure.Messaging.ServiceBus;
using Newtonsoft.Json;

namespace Mango.MessageBus;

public class AzureServiceBusMessageBus: IMessageBus
{
    private string connectionString =
        "Endpoint=sb://devmanu.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=A9y1UHhBVzZ90Tq6vKwgkGd0dzKIC3yu8Mf57f/sYs4=";
    public async Task PublishMessage(BaseMessage message, string topicName)
    {
        await using var client = new ServiceBusClient(connectionString);
        ServiceBusSender sender = client.CreateSender(topicName);
        
        var jsonMessage = JsonConvert.SerializeObject(message);
        ServiceBusMessage finalMessage = new ServiceBusMessage(Encoding.UTF8.GetBytes(jsonMessage))
        {
            CorrelationId = Guid.NewGuid().ToString()
        };

        await sender.SendMessageAsync(finalMessage);
        await client.DisposeAsync();
    }
}