using System.Collections.Generic;
using System.Threading.Tasks;
using Abp;
using UET.EGarden.Dto;

namespace UET.EGarden.Gdpr
{
    public interface IUserCollectedDataProvider
    {
        Task<List<FileDto>> GetFiles(UserIdentifier user);
    }
}
