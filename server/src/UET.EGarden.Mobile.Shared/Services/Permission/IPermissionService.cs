namespace tmss.Services.Permission
{
    public interface IPermissionService
    {
        bool HasPermission(string key);
    }
}