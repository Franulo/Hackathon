async def run_agent(user_data):
    return {
        "message": f"Agent received data: {user_data.first_name} {user_data.last_name}, Age: {user_data.age}, Gender: {user_data.gender}"
    }
