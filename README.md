# Database-Design-Optimization-for-Community-Engagement-Resource-Management-

## Overview
A comprehensive database design and analytics solution for Urban Root Garden, a non-profit organization focused on urban gardening and community engagement. The project combines robust database architecture with advanced analytics including machine learning models and optimization techniques.

## Project Components

### 1. Database Design

#### EER Model
- Comprehensive entity-relationship model covering:
  - Products (Seeds, Crops, Compost)
  - Plots and Tools
  - Events (Workshops, Volunteer Days, Educational Tours)
  - People (Members, Volunteers, Visitors)
  - Fund Management
  - Inventory Tracking

#### Relational Schema
22 interconnected tables including:
- Core entities (Product, Plot, Tool, Person, Event, Fund)
- Junction tables for many-to-many relationships
- Weak entities (Inventory, Planting Schedule)
- Specialized entities based on hierarchical relationships

```sql
-- Key Schema Examples
Product (Product_ID, Name, Quantity)
Plot (Plot_ID, Size, Location, Soil_Quality)
Person (PID, Name, Age, Address_State, Address_City)
Event (Event_ID, Name, Date, Capacity, Fund_ID, Amount)
```

### 2. Analytics Components

#### Community Engagement Analysis
- Logistic regression model analyzing donation likelihood
- Features:
  - Volunteer hours
  - Educational tour participation
  - Workshop involvement
  - Age demographics
- Performance Metrics:
  - Accuracy: 0.85
  - ROC/AUC analysis
  - TPR/FPR evaluation

#### Planting Schedule Optimization
- Integer programming model maximizing crop yield
- Constraints:
  - Available funds
  - Plot size limitations
  - Seed stock availability
- Key Results:
  - 55% fund utilization
  - 100% plot area optimization
  - Shadow price analysis for resource allocation

#### Member Engagement Analysis
- SQL-based activity tracking
- OLS regression analysis of engagement factors
- Key Findings:
  - Positive correlation with "Golden" membership
  - Gender-based participation patterns
  - Limited age-based correlation

## Technical Implementation

### Database Queries
Our query implementation focuses on three main areas:

1. **Member Engagement Analysis**
   - Utilizes Common Table Expressions (CTEs) to aggregate member activities
   - Combines participation data across different event types
   - Links member profiles with their activity history
   - Calculates engagement percentages based on attendance ratios

2. **Resource Optimization Queries**
   - Joins multiple tables to gather planting schedule information
   - Filters based on soil type compatibility
   - Aggregates financial data across different funding sources
   - Tracks inventory levels and resource availability

3. **Community Impact Analysis**
   - Combines demographic data with participation records
   - Measures engagement across different membership tiers
   - Tracks volunteer contributions and event participation
   - Analyzes donation patterns and community involvement

### Optimization Methodology
The planting schedule optimization employs an integer programming approach with:

1. **Objective Function**
   - Maximizes total crop yield
   - Accounts for different plant types and their respective yields
   - Considers seasonal variations and growing cycles

2. **Constraint Implementation**
   - Budget limitations for planting costs
   - Plot size and area restrictions
   - Inventory constraints for available seeds
   - Soil type compatibility requirements

3. **Resource Allocation**
   - Balances resource utilization across different plots
   - Optimizes planting timing and scheduling
   - Manages inventory levels efficiently
   - Considers maintenance requirements

## Results and Insights

### Key Findings
1. Donation Likelihood:
   - Current engagement metrics show limited correlation
   - Need for alternative predictive factors

2. Planting Optimization:
   - Achieved optimal yield of 1476 units
   - Plot size identified as critical constraint
   - Resource utilization analysis for future planning

3. Member Engagement:
   - Membership tier significance
   - Gender-based participation patterns
   - Need for expanded dataset and additional variables

## Dependencies
```
python==3.8+
pandas
numpy
scikit-learn
pulp
sqlalchemy
matplotlib
seaborn
```
