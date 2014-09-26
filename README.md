# SideWaffleMagic

Collection of SideWaffle templates.

## Requirements

Requirements to build SideWaffle packages are:

- SideWaffle extensions.
- Visual Studio SDK.

I don't know the minimum requirement for Visual Studio is. I'm using Visual Studio 2013 Professional.

These requirements do not apply to the use of these packages.

See https://www.youtube.com/watch?v=z33jOo75CH4&list=UUwEinBp3Mx1UuAR52pzRcNw for more details.

## Adding new projects

Add new projects as per usual.

After the project has been created:

### Update Configuration Manager

- Click **Build** menu
- Click **Configuration Manager...**
- Un-tick build for **Debug** & **Release** configurations

### Update SideWaffleMagic project

- Right-click **SideWaffleMagic** project
- Click **Add**
- Click **Add Template Reference**
- Select recently added project. *Ignore the fact file added to SideWaffleMagic project displays as missing.*

### Update new project

- Right-click **&lt;recently addedd project>** project
- Click **Add**
- Click **New Item**
- Click **Visual Studio C# Items**
- Click **Extensibility**
- Select **SideWaffle Project Template Files**
- Update metadata in _project.vstemplate.xml. &lt;Name /> is sufficient.
- Update configuration in _preprocess.xml. &lt;TemplateInfo /> is sufficient.


