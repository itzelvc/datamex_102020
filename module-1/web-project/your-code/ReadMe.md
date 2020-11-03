# ReadME

## Base de datos de Programas de tv
Este script genera una base datos con las siguientes columnas:
    
- **title:** título del programa de televisión
- **network:** cadena de televisión.
- **country:** país de la productora del programa de televisión.
- **classification:** clasificación del programa con base en la edad.
- **start_date:** fecha de transmisión del primer capitulo.
- **seasons:** número de temporadas.
- **status:** estatus del programa (en desarrollo, en transmisión, terminado)
- **rating:** rating del show según IMDb 
- **votes:** número de votos
- **cast:** actores del programa de televisión
- **description:** breve descripción de la trama del programa
- **+15 columnas dummies:** 'TV Comedies', 'Crime TV Shows', 'TV Dramas', 'Docuseries', 'Teen TV Shows', 'TV Horror', "Kids' TV", etc.


A partir de la extracción de 3 fuentes de información:

1. **Archivo csv:** https://www.kaggle.com/shivamb/netflix-shows?select=netflix_titles.csv
2. **API:** https://www.episodate.com/api
3. **Web scraping:** https://www.imdb.com/search/title/?title_type=tv_series
