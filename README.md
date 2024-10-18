***Algorithms Documentation***

## This project is built with:

- **Backend:** Django, Django Rest Framework
- **Database:** SQLite
- **Frontend:** Vue.js

## Tools

- Structurizr for building C4 diagrams
- ChatGPT for code improvements. Why not? 
  
## Code Guidelines

- **Typed Python Code:** Use type annotations in all functions and methods.
- **No Inheritance:** Favor **composition** and **aggregation** over class inheritance for better flexibility and maintainability.

## Setup

### Backend
1. Clone the repo and install dependencies:
   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   pip install -r requirements.txt
   ```
2. Apply migrations and run the server:
   ```bash
   python manage.py migrate
   python manage.py runserver
   ```

### Frontend
1. Navigate to the frontend directory:
   ```bash
   cd frontend
   npm install
   npm run serve
   ```
