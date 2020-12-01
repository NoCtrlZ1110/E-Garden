using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace UET.EasyAccommod.Migrations
{
    public partial class addaa : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Vocabulary",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreationTime = table.Column<DateTime>(nullable: false),
                    CreatorUserId = table.Column<long>(nullable: true),
                    LastModificationTime = table.Column<DateTime>(nullable: true),
                    LastModifierUserId = table.Column<long>(nullable: true),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeleterUserId = table.Column<long>(nullable: true),
                    DeletionTime = table.Column<DateTime>(nullable: true),
                    BookId = table.Column<long>(nullable: false),
                    UnitId = table.Column<long>(nullable: false),
                    Key = table.Column<string>(nullable: true),
                    Meaning = table.Column<string>(nullable: true),
                    Sound = table.Column<string>(nullable: true),
                    Type = table.Column<string>(nullable: true),
                    Example = table.Column<string>(nullable: true),
                    Ordering = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Vocabulary", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Vocabulary");
        }
    }
}
