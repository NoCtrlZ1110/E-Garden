using System.Collections.Generic;
using MvvmHelpers;
using tmss.Models.NavigationMenu;

namespace tmss.Services.Navigation
{
    public interface IMenuProvider
    {
        ObservableRangeCollection<NavigationMenuItem> GetAuthorizedMenuItems(Dictionary<string, string> grantedPermissions);
    }
}