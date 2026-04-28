# **FUENTES**: 
- https://docs.godotengine.org/en/stable/getting_started/step_by_step/signals.html
- https://kidscancode.org/godot_recipes/4.x/ai/homing_missile/index.html
- https://kidscancode.org/godot_recipes/4.x/2d/2d_shooting/index.html
- https://kidscancode.org/godot_recipes/4.x/games/first_2d/first_2d_07/index.html
- https://docs.godotengine.org/es/4.x/classes/class_vector2.html
- https://docs.godotengine.org/es/4.x/classes/class_array.html
- https://forum.godotengine.org/t/how-to-spawn-enemies-using-vector2-position-stored-in-array-while-digging-map-tiles/17942
- https://github.com/robyn3choi/godot-tutorial_bullet-hell-pattern-generator
- https://www.youtube.com/watch?v=Z2TaFnN7cdU
- https://www.youtube.com/watch?v=CNOAQUdPd_o
- https://www.youtube.com/watch?v=vVmIYijtikg
- https://www.youtube.com/watch?v=xWKHxTHvzTI
- https://docs.godotengine.org/es/4.x/tutorials/2d/2d_transforms.html
- https://docs.godotengine.org/es/4.x/tutorials/scripting/nodes_and_scene_instances.html
- https://docs.godotengine.org/es/4.x/getting_started/step_by_step/signals.html
- https://docs.godotengine.org/es/4.x/tutorials/2d/2d_movement.html
- https://docs.godotengine.org/es/4.x/classes/class_node2d.html
- https://docs.godotengine.org/es/4.x/tutorials/inputs/mouse_and_input_coordinates.html
- https://docs.godotengine.org/es/4.x/classes/class_camera2d.html
# **ASSETS**: 
- https://opengameart.org/content/3-lasers
- https://space-spheremaps.itch.io/pixelart-starfields
- https://gisha.itch.io/spaceships-asset-pack
- https://maxime-nourry.itch.io/64px-robot-pack
- https://marinesosa.itch.io/mech-assets

# **Análisis de dificultad y balance del juego**
Creo que el juego quedó con una dificultad media que está bastante bien. El nivel se pone interesante a medida que vas aprendiendo las mecánicas para pasar cada nivel. Para balancear la dificultad, trabajé principalmente tocando las hitboxes del personaje y ajustando tanto la velocidad como la cadencia de disparo de los enemigos.

En lo personal, me resultó divertido porque tiene bastante variación en el gameplay, lo que te lleva por distintas zonas de juego. Gracias a que mis compañeros probaron el juego, pude hacer ajustes clave: me dijeron que no era imposible pero que tampoco era fácil, así que achiqué un poco la hitbox de mi nave para que la Fase 3 sea más pasable. Por otro lado, para subir un poco el desafío y mejorar la estética, agrandé el sprite y la hitbox del mi jugador en el nivel final.

# **Desafíos técnicos y proceso de desarrollo**
El ajuste de los valores de las naves (vida, daño y disparos por segundo) me llevó varias iteraciones y pruebas. El punto justo lo logré alcanzar escuchando las opiniones de mis compañeros cuando testeamos el juego. A nivel técnico, tuve que lidiar con algunos bugs, especialmente uno donde las balas de fases anteriores no se borraban al cambiar de nivel y quedaban ahí molestando.

# **Recursos y colaboración**
Un tema complicado fue el de los assets, ya que la mayoría de las cosas de Star Wars son pagas y es difícil conseguir material de calidad de forma gratuita. Para la programación, mi gran ayuda fue la documentación de Godot y los tutoriales que compartieron mis compañeros por el canal de comunicación, como el de Melgarejo para lograr los disparos en espiral. El feedback constante de ellos fue fundamental, sobre todo en las charlas presenciales que tuvimos los últimos días antes de la entrega.

# **Mejoras a futuro e ideas pendientes**
Me hubiera gustado sumar más animaciones y pulir los tiempos de espera entre cada nivel. También siento que se podrían mejorar un poco más los disparos de mi propia nave. Como idea que me quedó pendiente, me hubiese gustado que la Estrella de la Muerte cargara un rayo láser súper potente que, antes de disparar, te diera unos segundos de aviso con una sombra o algo similar para que sepas dónde va a aparecer y lo puedas esquivar o que darth maul puede tener movimientos de ataque dentro del mapa.
