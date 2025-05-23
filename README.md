# Decentralized Energy Storage Management System

This project implements a decentralized energy storage management system using Clarity smart contracts on the Stacks blockchain. The system enables battery storage facilities to participate in grid services and earn revenue through a transparent, decentralized platform.

## Overview

The system consists of five main contracts that work together:

1. **Storage Facility Verification**: Validates and tracks battery installations
2. **Capacity Tracking**: Records and monitors available storage capacity
3. **Charge/Discharge**: Manages energy flow optimization based on grid demand
4. **Grid Services**: Provides frequency regulation and grid stability services
5. **Revenue Sharing**: Distributes earnings to stakeholders

## Contracts

### Storage Facility Verification

This contract handles the registration and verification of energy storage facilities:

- Register new battery installations
- Approve or reject facilities (admin only)
- Track facility status (pending, approved, rejected)
- Query facility information

### Capacity Tracking

This contract tracks the available capacity of registered storage facilities:

- Initialize capacity for approved facilities
- Update available capacity as batteries charge/discharge
- Query capacity information

### Charge/Discharge

This contract manages the energy flow optimization:

- Record charge and discharge actions
- Track grid demand levels
- Suggest optimal actions based on current grid conditions
- Optimize energy flow based on grid demand

### Grid Services

This contract handles grid services like frequency regulation:

- Create service requests for frequency regulation
- Allow facilities to fulfill service requests
- Track service request status
- Set and monitor frequency targets

### Revenue Sharing

This contract manages the distribution of earnings:

- Record revenue from grid services
- Set stakeholder shares for each facility
- Distribute revenue to stakeholders
- Track payment history

## Usage

### For Facility Owners

1. Register your facility using the Storage Facility Verification contract
2. Wait for admin approval
3. Initialize capacity for your approved facility
4. Participate in grid services by fulfilling service requests
5. Distribute earned revenue to stakeholders

### For Grid Operators (Admins)

1. Approve or reject facility registrations
2. Set grid demand levels
3. Create service requests for frequency regulation
4. Monitor grid stability metrics

## Testing

Tests are written using Vitest and can be run with:

\`\`\`bash
npm test
\`\`\`

## License

This project is licensed under the MIT License.
