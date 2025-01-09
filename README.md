# PLP_Group19_TrainBookingSystem

This repository contains the MySQL database for a train booking system, including tables for stations, passengers, and bookings.

## Database Schema

- **Stations**: Contains information about train stations.
- **Passengers**: Contains information about passengers.
- **Bookings**: Contains information about bookings made by passengers.

## Tables

### Stations
- `StationID` (Primary Key)
- `StationName`
- `Location`

### Passengers
- `PassengerID` (Primary Key)
- `Name`
- `Email`
- `Phone`

### Bookings
- `BookingID` (Primary Key)
- `StationID` (Foreign Key)
- `PassengerID` (Foreign Key)
- `BookingDate`

## Setting Up the Database

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/yourrepository.git
