using Abp.Application.Services.Dto;
using Abp.Runtime.Validation;

namespace UET.EGarden.Authorization.Users.Dto
{
    public class GetLinkedUsersInput : IPagedResultRequest, ISortedResultRequest, IShouldNormalize
    {
        public int MaxResultCount { get; set; }

        public int SkipCount { get; set; }

        public string Sorting { get; set; }

        public void Normalize()
        {
            if (string.IsNullOrEmpty(Sorting) || Sorting == "userName ASC")
            {
                Sorting = "TenancyName, Username";
            }
            else if (Sorting == "userName DESC")
            {
                Sorting = "TenancyName DESC, UserName DESC";
            }
        }
    }
}