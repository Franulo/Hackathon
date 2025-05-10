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
   agent = Agent(
      task=("Open the browser. Search for " + user_data.get('first_name', '') + " and return the link of the first website shown." ),
      llm=llm
   )

   return await agent.run()

