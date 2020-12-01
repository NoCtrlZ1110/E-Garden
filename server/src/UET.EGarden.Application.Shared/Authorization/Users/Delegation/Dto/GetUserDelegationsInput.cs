using Abp.Application.Services.Dto;
using Abp.Runtime.Validation;

namespace UET.EGarden.Authorization.Users.Delegation.Dto
{
    public class GetUserDelegationsInput : IPagedResultRequest, ISortedResultRequest, IShouldNormalize
    {
        public int MaxResultCount { get; set; }

        public int SkipCount { get; set; }

        public string Sorting { get; set; }

        public void Normalize()
        {
            if (string.IsNullOrEmpty(Sorting) || Sorting == "userName ASC")
            {
                Sorting = "Username";
            }
            else if (Sorting == "userName DESC")
            {
                Sorting = "UserName DESC";
            }
        }
    }
}