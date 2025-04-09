from flask import Flask, render_template, request, redirect, url_for
from pymongo import MongoClient
from bson.objectid import ObjectId
import os


app = Flask(__name__, template_folder="templates")  


client = MongoClient("mongodb://localhost:27017/")
db = client["ecommerce_videojuegos"]
games_collection = db["games"]


print("Ruta de templates:", os.path.join(os.getcwd(), "templates"))


@app.route("/")
def index():
    games = list(games_collection.find())
    return render_template("index.html", games=games)


@app.route("/add", methods=["POST"])
def add_game():
    try:
        titulo = request.form["titulo"].strip()
        descripcion = request.form["descripcion"].strip()
        precio = float(request.form["precio"].strip())

        if titulo and descripcion and precio >= 0:
            games_collection.insert_one({
                "titulo": titulo,
                "descripcion": descripcion,
                "precio": precio
            })
        else:
            raise ValueError("Los datos no pueden estar vacíos o tener valores negativos.")
    except Exception as e:
        return f"Error al agregar juego: {str(e)}", 400  

    return redirect(url_for("index"))


@app.route("/edit/<game_id>")
def edit_game(game_id):
    try:
        game = games_collection.find_one({"_id": ObjectId(game_id)})
        if game:
            return render_template("edit.html", game=game)
        else:
            return "Juego no encontrado", 404
    except Exception as e:
        return f"Error al obtener juego: {str(e)}", 400


@app.route("/update/<game_id>", methods=["POST"])
def update_game(game_id):
    try:
        titulo = request.form["titulo"].strip()
        descripcion = request.form["descripcion"].strip()
        precio = float(request.form["precio"].strip())

        if titulo and descripcion and precio >= 0:
            games_collection.update_one(
                {"_id": ObjectId(game_id)},
                {"$set": {"titulo": titulo, "descripcion": descripcion, "precio": precio}}
            )
        else:
            raise ValueError("Los datos no pueden estar vacíos o tener valores negativos.")
    except Exception as e:
        return f"Error al actualizar juego: {str(e)}", 400

    return redirect(url_for("index"))


@app.route("/delete/<game_id>")
def delete_game(game_id):
    try:
        result = games_collection.delete_one({"_id": ObjectId(game_id)})
        if result.deleted_count == 0:
            return "Juego no encontrado", 404
    except Exception as e:
        return f"Error al eliminar juego: {str(e)}", 400

    return redirect(url_for("index"))

if __name__ == "__main__":
    app.run(debug=True)  
 