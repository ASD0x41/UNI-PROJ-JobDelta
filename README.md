# JobDelta (*Freelancing Portal*)
---
## Database Systems Lab (CL-2005) Project - BCS-4F (Group A)
---
## Group Members:
+ Muhammad Asad Tariq (21L-5266)
+ Muhammad Mehdy Hasnain (21L-1784)
+ Sultan Ahmad (21L-7560)
+ Umair bin Asim (21L-1847)
+ Mudesser Ahmad (21L-5387)
---
## Site Map:
> UNDER CONSTRUCTION
---
## Project Outline:
```mermaid
flowchart TB
	subgraph common["Common Elements"]
    direction LR
    theme["Website Theme (~/Content/Site.css)"] --- master["Master Page (~/Site.Master)"] --- master_mobile["Mobile Master Page (~/Site.Mobile.Master)"]
  end
  subgraph webforms["Web Pages"]
    direction LR
    subgraph other1[Other Pages]
      direction TB
      other1front["~/Otherpage.aspx"] --- other1back["~/Otherpage.aspx.cs"]
    end
    subgraph homepage[Home Page]
      direction TB
      homepagefront["~/Default.aspx"] --- homepageback["~/Default.aspx.cs"]
    end
    subgraph other2[Other Pages]
      direction TB
      other2front["~/Otherpage.aspx"] --- other2back["~/Otherpage.aspx.cs"]
    end
    other1 ~~~ homepage ~~~ other2
  end
  common --- webforms
  subgraph data_access["Data Access Layer"]
    direction TB
    DAL["Data Access Layer (~/Data_Access_Layer/DAL.cs)"] --- con_string["Connection String (~/Web.config)"]
  end
  webforms --- data_access
  subgraph db["Database (~/App_Data/JobDelta_Data.mdf)"]
    direction TB
      stored_procs["Stored Procedures (~/App_Data/schema.sql)"] --- schema["Schema (~/App_Data/storedprocs.sql)"]
  end
  data_access --- db
 ```
