import pandas as pd
from src.connection.client import client
from src.queries.sorts import get_aggregate_sorts
from src.utilities.plot import plot

movie_collection = client.themoviedb.movies_tests

def get_genres():


