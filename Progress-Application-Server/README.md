# Progress Application Server for OpenEdge
Learn how to work with a Progress Application Server (PAS) for OpenEdge instance in your development environment. Learn how to deploy the code to a PAS for OpenEdge instance using the Progress Developer Studio for OpenEdge. Learn how to access the remote procedures hosted on a PAS for OpenEdge instance. You understand the concepts of REST, how RESTful services work with PAS for OpenEdge, and how to authenticate them on a PAS for OpenEdge instance. Learn about the PAS for OpenEdge event procedures and how to set them using the Developer Studio.

- Create, start, stop, and delete a PAS for OpenEdge instance.
- Deploy code to a PAS for OpenEdge instance.
- Access an ABL application hosted on a PAS for OpenEdge instance.
- Invoke remote procedures on a PAS for OpenEdge instance.
- Debug an ABL application hosted on a PAS for OpenEdge instance.
- Create a RESTful service using a PAS for OpenEdge instance.
- Secure an ABL application hosted on a PAS for OpenEdge instance by using different login models and authentication managers.
- Set the PAS for OpenEdge event procedures using the Developer Studio.

 Roughly 12 hours of learning

 ## Setup
 
- Extract the introtopasforopenedge ZIP to C:\progress_education\openedge
- Start the database server
-- Go to Start > Progress > Proenv 12.2 (64 bit).
-- Navigate to \progress_education\openedge\IntroToPASForOpenEdge\db:
```
cd \progress_education\openedge\IntroToPASForOpenEdge\db
```
-- Create a copy of the sports2020 database in the db directory:
```
prodb sports2020 sports2020
```
-- Start the database server for the sports2020 database:
```
proserve sports2020 –H localhost –S 9000 
```
-- Close the Proenv window.
- Create Workspace
-- Launch the Developer Studio by navigating to Start > Progress > Developer Studio 12.2 (64 bit). The OpenEdge wizard prompts you to select a workspace.
-- Click Browse, specify C:\progress_education\openedge\IntroToPASForOpenEdge\workspace as the workspace location, and then click Select Folder.
-- Click Launch. The welcome page of the Developer Studio appears.
-- Click Workbench. The Project Explorer window opens.
- Connect your workspace to the sports2020 database:
-- Window > Preferences and navigate to Progress OpenEdge > Database Connections. The Database Connections page appears.
-- Click New. The Add Connection Profile page appears.
-- In the Connection name field, specify sports2020.
-- In the Physical name field, click Browse, go to C:\progress_education\openedge\IntroToPASForOpenEdge\db, then select sports2020.db, and click Save.
-- In the Host name field, type localhost .
-- In the Service/Port field, type 9000 and then click Next
-- On the Define a SQL connection page, retain the default settings and click Next.
-- On the Add SQL Connection Profile page, retain the default settings and click Next.
-- On the Define Database Server Configuration page, retain the default settings and click Finish.
-- Click Apply and Close. A connection is added to Database Connections.





