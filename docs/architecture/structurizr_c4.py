from structurizr.model import Workspace
from structurizr.view import SystemContextView, ContainerView
from structurizr.view.styles import Shape

# Create a Structurizr workspace
workspace = Workspace("Algorithms Visualization Project", "An interactive platform for studying algorithms.")

# Define the software system
model = workspace.model
software_system = model.add_software_system("Algorithm Visualization Platform", "Provides algorithm visualization and RAM tracking.")
user = model.add_person("User", "A user studying algorithms.")
user.uses(software_system, "Uses to study algorithms.")

# Define containers
web_app = software_system.add_container(
    "Web Application", 
    "Handles user requests, serves algorithm visualizations, and manages API requests.", 
    "Django"
)
api = software_system.add_container(
    "API", 
    "Provides REST API for frontend communication and manages algorithm data.", 
    "Django Rest Framework"
)
frontend = software_system.add_container(
    "Frontend", 
    "The user interface for visualizing algorithms and interacting with the platform.", 
    "Vue.js"
)
database = software_system.add_container(
    "Database", 
    "Stores algorithm data, user comments, and other relevant information.", 
    "SQLite"
)

# Define relationships
user.uses(web_app, "Interacts with through a web browser.")
web_app.uses(api, "Communicates with via API requests.")
api.uses(database, "Reads from and writes to")

# Create views
views = workspace.views
context_view = views.create_system_context_view(software_system, "SystemContext", "System context diagram for the algorithms platform.")
context_view.add_all_elements()

container_view = views.create_container_view(software_system, "Containers", "Container diagram for the algorithms platform.")
container_view.add_all_elements()

# Add styling
styles = views.configuration.styles
styles.add_element_style("Software System").background("#1168bd").color("#ffffff")
styles.add_element_style("Container").background("#438dd5").color("#ffffff").shape(Shape.Box)
styles.add_element_style("Person").background("#08427b").color("#ffffff").shape(Shape.Person)

# Export the workspace to a JSON file (to use with Structurizr Lite or other tools)
workspace.save("structurizr_diagram.json")
