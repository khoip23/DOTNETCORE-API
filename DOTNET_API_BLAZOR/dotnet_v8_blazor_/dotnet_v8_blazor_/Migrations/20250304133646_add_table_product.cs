using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace web_api_base.Migrations
{
    /// <inheritdoc />
    public partial class add_table_product : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_EntityNames",
                table: "EntityNames");

            migrationBuilder.RenameTable(
                name: "EntityNames",
                newName: "Users");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Users",
                table: "Users",
                column: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Users",
                table: "Users");

            migrationBuilder.RenameTable(
                name: "Users",
                newName: "EntityNames");

            migrationBuilder.AddPrimaryKey(
                name: "PK_EntityNames",
                table: "EntityNames",
                column: "Id");
        }
    }
}
