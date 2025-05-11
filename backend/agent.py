import asyncio
import os
from langchain_openai import ChatOpenAI
from browser_use import Agent
from dotenv import load_dotenv

async def run_agent(user_data):
    # Load environment variables
    load_dotenv()
    
    # Initialize the model
    llm = ChatOpenAI(model="gpt-4o", api_key=os.getenv("OPENAI_API_KEY"))

    # Create agent with the model
    agent = Agent(
        task=("Open the browser. Search for " + user_data.get('first_name', '') + 
              " and return the link of the first website shown."),
        llm=llm
    )

    # Run the agent
    result = await agent.run()

    # Debug print
    print("🧪 agent result:", result)
    print("🧪 result type:", type(result))

    # Parse result safely
    if isinstance(result, dict):
        # Try different key formats to be safe
        for key in ["firstWebsiteLink", "first_website_link", "first_search_result_link"]:
            if key in result:
                return result[key]
        return "No URL"
    elif isinstance(result, str):
        return result
    else:
        return str(result)[:300]  # fallback
