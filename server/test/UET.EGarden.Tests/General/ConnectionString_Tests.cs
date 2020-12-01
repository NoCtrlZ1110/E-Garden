using System.Data.SqlClient;
using Shouldly;
using Xunit;

namespace UET.EGarden.Tests.General
{
    // ReSharper disable once InconsistentNaming
    public class ConnectionString_Tests
    {
        [Fact]
        public void SqlConnectionStringBuilder_Test()
        {
            var csb = new SqlConnectionStringBuilder("Server=localhost; Database=UET.EGarden; Trusted_Connection=True;");
            csb["Database"].ShouldBe("UET.EGarden");
        }
    }
}
