using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace UET.EGarden.Migrations
{
    public partial class user_table : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "UnitId",
                table: "Unit");

            migrationBuilder.AddColumn<string>(
                name: "Hexcode",
                table: "UserNote",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "BookId",
                table: "Unit",
                nullable: false,
                defaultValue: 0L);

            migrationBuilder.CreateTable(
                name: "UserAchieverment",
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
                    LearnWord = table.Column<long>(nullable: false),
                    LearnReview = table.Column<long>(nullable: false),
                    Level = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserAchieverment", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserDetail",
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
                    Name = table.Column<string>(nullable: true),
                    School = table.Column<string>(nullable: true),
                    Address = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    Gender = table.Column<string>(nullable: true),
                    Age = table.Column<long>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserDetail", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserAchieverment");

            migrationBuilder.DropTable(
                name: "UserDetail");

            migrationBuilder.DropColumn(
                name: "Hexcode",
                table: "UserNote");

            migrationBuilder.DropColumn(
                name: "BookId",
                table: "Unit");

            migrationBuilder.AddColumn<long>(
                name: "UnitId",
                table: "Unit",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);
        }
    }
}
