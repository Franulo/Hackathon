from fastapi import FastAPI
from schema import UserRequest
from agent import run_agent
from db import save_user_to_db
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 开发时允许所有源
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/search")
async def search_apartments(user: UserRequest):
    # save the user's info
    user_dict = user.model_dump()
    mongo_id = save_user_to_db(user_dict)

    # call AI Agent
    result = await run_agent(user_dict)

    return {"mongo_id": mongo_id, "result": result}
