using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace UET.EGarden.Migrations
{
    public partial class add_note : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "UserNote",
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
                    UserId = table.Column<long>(nullable: false),
                    StartTime = table.Column<TimeSpan>(nullable: false),
                    EndTime = table.Column<TimeSpan>(nullable: false),
                    Date = table.Column<DateTime>(nullable: false),
                    TitleNote = table.Column<string>(nullable: true),
                    DetailNote = table.Column<string>(nullable: true),
                    Status = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserNote", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserNote");
        }
    }
}
