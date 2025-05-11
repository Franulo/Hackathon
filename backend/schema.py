from pydantic import BaseModel

class UserRequest(BaseModel):
    first_name: str
    last_name: str
    age: int
    job: str
    gender: str

    website: str
    rentFrom: str
    rentTo: str
    city: str
    country: str 
