using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace UET.EGarden.Migrations
{
    public partial class add_column_table_User : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ExampleGrammar");

            migrationBuilder.DropTable(
                name: "UserDetail");

            migrationBuilder.AddColumn<string>(
                name: "Example",
                table: "Grammar",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Address",
                table: "AbpUsers",
                nullable: true);

            migrationBuilder.AddColumn<long>(
                name: "Age",
                table: "AbpUsers",
                nullable: false,
                defaultValue: 0L);

            migrationBuilder.AddColumn<string>(
                name: "Gender",
                table: "AbpUsers",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "School",
                table: "AbpUsers",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Example",
                table: "Grammar");

            migrationBuilder.DropColumn(
                name: "Address",
                table: "AbpUsers");

            migrationBuilder.DropColumn(
                name: "Age",
                table: "AbpUsers");

            migrationBuilder.DropColumn(
                name: "Gender",
                table: "AbpUsers");

            migrationBuilder.DropColumn(
                name: "School",
                table: "AbpUsers");

            migrationBuilder.CreateTable(
                name: "ExampleGrammar",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorUserId = table.Column<long>(type: "bigint", nullable: true),
                    DeleterUserId = table.Column<long>(type: "bigint", nullable: true),
                    DeletionTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Detail = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    GrammarId = table.Column<long>(type: "bigint", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierUserId = table.Column<long>(type: "bigint", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExampleGrammar", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserDetail",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Age = table.Column<long>(type: "bigint", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatorUserId = table.Column<long>(type: "bigint", nullable: true),
                    DeleterUserId = table.Column<long>(type: "bigint", nullable: true),
                    DeletionTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Gender = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false),
                    LastModificationTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    LastModifierUserId = table.Column<long>(type: "bigint", nullable: true),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    School = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserDetail", x => x.Id);
                });
        }
    }
}
