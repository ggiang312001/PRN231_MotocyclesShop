using BusinessObjects.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Newtonsoft.Json;

namespace MGiangStoreWebClient.Filters
{
    public class CustomAuthorizationFilter : Attribute, IAuthorizationFilter
    {
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var session = context.HttpContext.Session;
            var serializeMember = session.GetString("loginUser");
            if (serializeMember != null)
            {
                var member = JsonConvert.DeserializeObject<Account>(serializeMember);
                if (member.RoleId == 1)
                {
                    return;
                }
            }
            context.Result = new StatusCodeResult(StatusCodes.Status403Forbidden);
        }
    }
}
