import asyncio
import os
from langchain_openai import ChatOpenAI
from browser_use import Agent
from dotenv import load_dotenv

async def run_agent(user_data):

   # Read GEMINI_API_KEY into env
   load_dotenv()
   
   # Initialize the model
   llm = ChatOpenAI(model="gpt-4o", api_key=os.getenv("OPENAI_API_KEY"))

   # Create agent with the model
   if (user_data.get('website', '') == 'Flatfox'): 

      agent = Agent(
         task=("Open https://flatfox.ch/c/en/. Log in into the account: 'DatunaZora572@gmail.com', password: 'Test123!'. "
         "When asked about a code open a second tab and log in into gmail: 'DatunaZora572@gmail.com', password: 'b9pcxivkbi'. "
         "Then go to the newes mail and copy the code from there."
         "After login in into flatfox do the following:"
         f"You are a {user_data.get('job', '')} by the name {user_data.get('first_name')} {user_data.get('last_name', '')} and you are looking for a flat in {user_data.get('city', '')}, {user_data.get('country', '')}. "
               "1. Set filters for: "
               f"   - Maximum rent: {user_data.get('rentTo', '')} CHF "
               f"   - Location: {user_data.get('city', '')} "
               "   - Type: Apartment/Flat only (no parking or hobby rooms) "
               "2. For each listing that matches these criteria: "
               "   - Store: URL, address, price, title, rooms, size (m²) "
               "   - Click to view details "
               "   - Contact the landlord with a friendly message asking to schedule a visit "
               "   - Send a copy of each contact request to datunazora572@gmail.com "
               "   - Log each contact and message on the console "
               "3. Important rules: "
               "   - Process ALL matching listings, not just the first one "
               "   - Go through ALL pages of results "
               "   - Skip listings without prices "
               "   - Skip non-apartment listings (parking, hobby rooms) "
               "   - Keep track of processed listings to avoid duplicates "
               "4. When finished: "
               "   - Log a JSON of all processed listings on the console "
               "   - Include all contact attempts in the log "
               "If needed: Log in with datunazora572@gmail.com, password: Test123! "
               "Accept all cookies."),
         llm=llm
      )  

   else:
      agent = Agent(
         task=(f"You are a {user_data.get('job', '')} by the name {user_data.get('first_name')} {user_data.get('last_name', '')} and you are looking for a flat in {user_data.get('city', '')}, {user_data.get('country', '')}. "
               "Go to https://www.homegate.ch/mieten/immobilien/ort-zuerich/ and follow these steps: "
               "1. Set filters for: "
               f"   - Maximum rent: {user_data.get('rentTo', '')} CHF "
               f"   - Location: {user_data.get('city', '')} "
               "   - Type: Apartment/Flat only (no parking or hobby rooms) "
               "2. For each listing that matches these criteria: "
               "   - Store: URL, address, price, title, rooms, size (m²) "
               "   - Click to view details "
               "   - Contact the landlord with a friendly message asking to schedule a visit "
               "   - Send a copy of each contact request to datunazora572@gmail.com "
               "   - Log each contact and message on the console "
               "3. Important rules: "
               "   - Process ALL matching listings, not just the first one "
               "   - Go through ALL pages of results "
               "   - Skip listings without prices "
               "   - Skip non-apartment listings (parking, hobby rooms) "
               "   - Keep track of processed listings to avoid duplicates "
               "4. When finished: "
               "   - Log a JSON of all processed listings on the console "
               "   - Include all contact attempts in the log "
               "If needed: Log in with datunazora572@gmail.com, password: Test123! "
               "Accept all cookies."),
         llm=llm
      ) 

   return await agent.run()

