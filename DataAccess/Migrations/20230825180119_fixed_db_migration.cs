using Microsoft.EntityFrameworkCore.Migrations;

namespace DataAccess.Migrations
{
    public partial class fixed_db_migration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Reservations_ReservedRooms_ReservedRoomReservationId_ReservedRoomRoomId",
                table: "Reservations");

            migrationBuilder.DropForeignKey(
                name: "FK_Rooms_ReservedRooms_ReservedRoomReservationId_ReservedRoomRoomId",
                table: "Rooms");

            migrationBuilder.DropIndex(
                name: "IX_Rooms_ReservedRoomReservationId_ReservedRoomRoomId",
                table: "Rooms");

            migrationBuilder.DropIndex(
                name: "IX_Reservations_ReservedRoomReservationId_ReservedRoomRoomId",
                table: "Reservations");

            migrationBuilder.DropColumn(
                name: "ReservedRoomReservationId",
                table: "Rooms");

            migrationBuilder.DropColumn(
                name: "ReservedRoomRoomId",
                table: "Rooms");

            migrationBuilder.DropColumn(
                name: "ReservedRoomReservationId",
                table: "Reservations");

            migrationBuilder.DropColumn(
                name: "ReservedRoomRoomId",
                table: "Reservations");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ReservedRoomReservationId",
                table: "Rooms",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ReservedRoomRoomId",
                table: "Rooms",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ReservedRoomReservationId",
                table: "Reservations",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ReservedRoomRoomId",
                table: "Reservations",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Rooms_ReservedRoomReservationId_ReservedRoomRoomId",
                table: "Rooms",
                columns: new[] { "ReservedRoomReservationId", "ReservedRoomRoomId" });

            migrationBuilder.CreateIndex(
                name: "IX_Reservations_ReservedRoomReservationId_ReservedRoomRoomId",
                table: "Reservations",
                columns: new[] { "ReservedRoomReservationId", "ReservedRoomRoomId" });

            migrationBuilder.AddForeignKey(
                name: "FK_Reservations_ReservedRooms_ReservedRoomReservationId_ReservedRoomRoomId",
                table: "Reservations",
                columns: new[] { "ReservedRoomReservationId", "ReservedRoomRoomId" },
                principalTable: "ReservedRooms",
                principalColumns: new[] { "ReservationId", "RoomId" },
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Rooms_ReservedRooms_ReservedRoomReservationId_ReservedRoomRoomId",
                table: "Rooms",
                columns: new[] { "ReservedRoomReservationId", "ReservedRoomRoomId" },
                principalTable: "ReservedRooms",
                principalColumns: new[] { "ReservationId", "RoomId" },
                onDelete: ReferentialAction.Restrict);
        }
    }
}
