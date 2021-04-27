import pandas as pd
from app.connection.client import client
from app.queries.sorts import get_aggregate_sorts
from app.utilities.plot import plot

movie_collection = client.themoviedb.movies_tests

def get_genres():


