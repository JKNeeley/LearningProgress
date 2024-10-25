 # ABL Essentials
ABL Essentials provides ABL developers the foundation required to understand the powerful underlying capabilities of the combination of ABL and OpenEdge suite of products to write compact, efficient, purposeful code using powerful syntax and constructs to process data.
- Retrieve and display data from OpenEdge database
- Develop program logic
- Use queries
- Create, Update, and delete records
- Manage transactions
- Manage record locking
- Handle errors
- Develop modular code
- Integrate business logic into an application
Roughly 25 hours of learning

## Setup
### Setting up a workspace in the Developer Studio
- Start Developer Studio by selecting Start > Progress > Developer Studio 12.2 (64 bit).
- If this is your first time using Developer Studio, the first dialog is for you to specify where your workspace is located.
-- Specify C:\progress_education\openedge as the workspace location.
-- Click Launch.
-- You may first see the welcome screen as shown here. Click the Workbench icon to continue to the workspace for Developer Studio.
- If you have previously used Developer Studio for OpenEdge, you must switch to a new workspace.
-- Select File > Switch Workspace > Other….
-- Specify C:\progress_education\openedge as the workspace location.
-- Click Launch. Developer Studio will restart.
- Modify these workspace preferences as follows:
-- Select Window > Preferences.
-- In the Preferences window, navigate to General > Editors > Text Editors.
-- Select Show line numbers.
-- Click Apply.
-- Navigate to Progress OpenEdge > Editor.
-- Select Upper in the Case area if not already selected.
-- Select Expand keywords and Case keywords in the As you type area.
-- Select Apply keyword(s) casing on save.
-- Select Expand database tables and fields.
-- Click Apply.
-- Navigate to Progress OpenEdge > Editor > Build.
-- Select all boxes in the Actions and Syntax check areas.
-- Click Apply and Close.

### Setting up a project in the Developer Studio
- Select File > New > OpenEdge Project.
- In the New OpenEdge Project wizard:
-- Enter ABLEssentials for the project name.
-- Select the General icon.
-- Select OpenEdge Basic for the project type.
-- Click Next.
-- In the Select AVM and layout options window, select Use separate source and r-code directories.
-- Change the R-code directory from rcode to bin.
-- Click Finish.
-- If the Open Associated Perspective dialog is displayed, asking you if you want to open the project in the OpenEdge Editor perspective. click Open Perspective.

### Starting the Database Server
- Open a Proenv window by selecting Start > Progress > Proenv 12.2 (64 bit).
- Prepare a location for the database files:
-- Navigate to C:\progress_education\openedge\ABLEssentials:
```
cd C:\progress_education\openedge\ABLEssentials
```
-- Create a directory called db for the database:
```
mkdir db
```
-- Navigate to the db directory:
```
cd db
```
- Create a copy of the sports2020 database in the course db directory as follows:
```
prodb sports2020 sports2020
```
```
proenv>prodb sports2020 sports2020
Procopy session begin for admin on CON:. (451)
Database copied from C:\Progress\OpenEdge\sports2020. (1365)
Procopy session end. (334)
```
- Start the database server for the sports2020 database as follows:
```
proserve sports2020 –H localhost –S 50000
```
```
proenv>proserve sports2020 -H localhost -S 50000
OpenEdge Release 12.2 as of Tue Mar 17 19:02:26 EDT 2020
22:21:35 BROKER     This broker will terminate when session ends. (5405)
22:21:35 BROKER     The startup of this database requires 40Mb of shared memory.  Maximum segment size is 1024Mb.
22:21:35 BROKER  0: Multi-user session begin. (333)
22:21:35 BROKER  0: Before Image Log Initialization at block 0  offset 639. (15321)
22:21:35 BROKER  0: Login by admin on CON:. (452)
22:21:35 BROKER  0: Started for 50000 using TCP IPV4 address 127.0.0.1, pid 25536. (5644)
```
- Close the Proenv window.

### Configuring the project to use the database
- Right-click the ABLEssentials project in the Project Explorer pane and then select Properties.
- Navigate to Progress OpenEdge > Database Connections.
- Click the Configure database connections link.
- Click New to open the Add Connection Profile wizard.
- Enter the connection name, Sports2020DB.
- Click the Browse button and then navigate to and select C:\progress_education\openedge\ABLEssentials\db\sports2020.db. Click Save.
- Specify the host name of localhost.
- Specify the service/port number as 50000. If port 50000 is unavailable on your system, use a different port number. (It must be the same port number that you specified when you started the Database Server.)
- Click the Test Connection button.
- After the test succeeds, click OK. If the connection did not succeed, you will need to investigate why the connection failed. Is the Database Server for the database running?
- Click Next. The Define a SQL connection window opens. You will leave the defaults for this window.
- Click Next. The Add SQL Connection Profile window opens. Here you retain the values that have been automatically set for you by the wizard.
- Click the Test Connection button. Then click OK when the test succeeds.
- Click Next. The Define Database Server Configuration window opens. Notice that Auto-start database server is selected. Leave that box selected. Developer Studio will automatically start the Database Server for you. Do not select Auto-shutdown database server.
- Click Finish.
- After the configuration is completed, the connection string is shown as:
```
-db ABLEssentials\db\sports2020.db -H localhost -S 50000
```
- Click Apply and Close. You are back in the Database Connections window.
- Check the box next to the connection profile you just configured.
- Click Apply and Close to complete the configuration. You will notice in the console that the AVM for the ABLEssentials project restarts. This is because it must start an AVM that has an active connection to the Database Server. Notice also that in the Project Explorer pane (on the left), the ABLEssentials project appears with the bin and src folders.

### Importing the example code files
- In the Project Explorer pane, right click on src and select Import > Import. The Import wizard is displayed.
- Expand the General node and select Archive File. Click Next.
- Click Browse and navigate to the folder where you downloaded the zipped file, ABLEssentials.zip. Select ABLEssentials.zip and click Open.
- Expand the root folder of the zipped file (/) displayed in the left box. All the sub-folders and the files in the folders are selected by default. Notice that the Into folder points to the ABLEssentials/src folder in the project workspace.
- Click Finish. The example code files should be imported into the ABLEssentials project and visible in the Project Explorer tab.

### Configure the PROPATH
- Right click on your project's root node (ABLEssentials) in the Project Explorer and select Properties. The Properties for ABLEssentials window is displayed.
- In the left panel expand and select Progress OpenEdge > PROPATH.
- Click Add Workspace Directory. The Select PROPATH Directory displays.
- Expand and select ABLEssentials > src > Examples.
- Click OK. Click Apply and Close. You should see a new entry in the PROPATH list, @{ROOT}\src.

## Problems
- Try-It 5.1: I was unable to generate a compile listing due to a constant error saying my file was not found.
