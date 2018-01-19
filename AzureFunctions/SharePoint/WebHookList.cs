using Microsoft.SharePoint.Client;
using System;
using System.Collections.Generic;
using System.Linq;

namespace AzureFunctions
{
    public class WebHookList : SharePointList
    {
        new internal static String DefaultListTitle = "Webhook List";

        const String Title = "Title";
        public const String PaymentStatus = "PaymentStatus";
        public const String WebhookProcessedDate = "WebhookProcessed";
        const String Created = "Created";

        public WebHookList(ClientContext spContext) : base(spContext)
        {
            this.ListTitle = DefaultListTitle;
        }

        /// <summary>
        /// Given a <see cref="List"/> of item ids, return a <see cref="List"/> of <see cref="ListItem"/>s 
        /// corresponding to those Ids.
        /// </summary>
        /// <param name="itemIdsToBeProcessed"></param>
        public override List<ListItem> GetItemsById(HashSet<Int32> itemIdsToBeProcessed)
        {
            if (this.List == null)
            {
                //  Using this method call to initialize this.List.  Completed data is retrieved below.  
                CamlQuery itemsQuery = CamlQuery.CreateAllItemsQuery(1, "Id", "Title", "Created", "Author", "Modified", "ContentTypeId", PaymentStatus, WebhookProcessedDate);
                this.LoadList(itemsQuery);
            }

            List<ListItem> returnItems = new List<ListItem>();

            foreach (Int32 currentItemId in itemIdsToBeProcessed)
            {
                ListItem eventItem = this.List.GetItemById(currentItemId);
                this.SharePointContext.Load(eventItem, item => item.Id, item => item["Title"], item => item["Created"], item => item["Author"], item => item["Modified"], item => item["ContentTypeId"]
                                                                                , item => item[PaymentStatus], item => item[WebhookProcessedDate]);
                try
                {
                    this.SharePointContext.ExecuteQuery();
                    returnItems.Add(eventItem);
                }
                catch (Microsoft.SharePoint.Client.ServerException)
                {
                }
            }

            return returnItems;
        }

    }
}
