from flask import Flask
from datetime import datetime
from flask import Flask, render_template, request
from app.utilities.paginate import get_pagination_routes
import app.queries.movies as query_movie
import app.queries.artists as query_artist

app = Flask(__name__)

@app.route("/home")
def hello():
    return "<h1>A great website for movie nerds</h1>"

@app.route("/movies")
def movies():
    page_num = request.args.get('page') if request.args.get('page') else 1
    sorts = request.args.getlist('sorts[]')
    order = request.args.get('order') if request.args.get('order') else -1
    links = get_pagination_routes(page_num, request)
    movies = query_movie.get_movies_paginated(15, int(page_num), sorts, order)

    return render_template("movies.html", movies=movies, links=links)

@app.route("/movies/stats")
def movies_stats():
    plot_urls = query_movie.get_movies_stats()
    plot_urls.append(query_movie.best_films_genres())
    plot_urls_decoded = [plot_url.decode('utf8') for plot_url in plot_urls]

    return render_template('movies_stats.html', plot_urls=plot_urls_decoded)

# if __name__ == "__main__":
#     print('NNNNNAAAMMMME')
# app.run()
