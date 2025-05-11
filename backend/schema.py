from pydantic import BaseModel

class UserRequest(BaseModel):
    first_name: str
    last_name: str
    age: int
    gender: str

    website: str
    rentFrom: str
    rentTo: str
    city: str
    country: str 
