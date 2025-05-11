from fastapi import FastAPI
from schema import UserRequest
from agent import run_agent
from db import save_user_to_db, update_user_result
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # allow cros
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# @app.post("/search")
# async def search_apartments(user: UserRequest):
#     # save the user's info
#     user_dict = user.model_dump()
#     mongo_id = save_user_to_db(user_dict)

#     # call AI Agent
#     result = await run_agent(user_dict)

    
#     # user_dict["result"] = result
#     # save_user_to_db(user_dict)

#     # Update MongoDB with result
#     update_user_result(mongo_id, result)

#     return {"mongo_id": mongo_id, "result": result}

@app.post("/search")
async def search_apartments(user: UserRequest):
    user_dict = user.model_dump()
    mongo_id = save_user_to_db(user_dict)

    result = await run_agent(user_dict)

    user_dict["result"] = result
    update_user_result(mongo_id, result)  

    return {"mongo_id": str(mongo_id), "result": result}




