import asyncio
from langchain_openai import ChatOpenAI
from browser_use import Agent
from dotenv import load_dotenv

# Read GEMINI_API_KEY into env
load_dotenv()

# Initialize the model
llm=ChatOpenAI(model="gpt-4o"),


# Create agent with the model
agent = Agent(
    task=("You are a developer by the name Datun Azora and you are looking for a flat in Zürich. "
             "Go to https://www.homegate.ch/mieten/immobilien/ort-zuerich/ and follow these steps: "
             "1. Set filters for: "
             "   - Maximum rent: 1000 CHF "
             "   - Location: Zürich "
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
             "If needed: Log in with datunazora572@gmail.com / Test123! "
             "Accept all cookies."),
    llm=llm
)

# Run the agent in async event loop
async def main():
    await agent.run()

asyncio.run(main())
