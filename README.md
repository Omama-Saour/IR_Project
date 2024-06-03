# IR_Project
## Information Retrieval (IR) Project
This project is a Service-Oriented Architecture (SOA) implementation of an Information Retrieval (IR) system. It consists of several key services that work together to provide a comprehensive IR solution.

## Services
### Data Processing: 
This service is responsible for preprocessing the input data, which is typically in the form of a CSV file. It performs text preprocessing tasks such as tokenization, stopword removal, and stemming/lemmatization.
### Indexing: 
This service creates a corpus from the preprocessed data and generates a TF-IDF (Term Frequency-Inverse Document Frequency) matrix and a model file. These artifacts are used for efficient document retrieval and ranking.
### Query Processing: 
This service takes the user's search query and processes it, preparing it for the matching and ranking process.
### Matching and Ranking: 
This service uses the TF-IDF matrix and model file to match the user's query with the documents in the corpus and rank the results based on relevance.
### Query Refinement: 
This service refines the user's query by performing spell checking and comparing it to previous queries stored in a history file, providing the user with suggestions for improving the query.

## Installation and Usage
Install the required dependencies:
pip install fastapi
pip install uvicorn
pip install pyspellchecker
pip install nltk

Depending on your Python environment, you may need to install additional dependencies required by the project.

## Run the FastAPI application:
python main.py
The application will start running on http://localhost:8000.
You can interact with the various services by sending HTTP requests to the corresponding endpoints. Refer to the code for more details on the API endpoints and their usage.

## Project Structure
The project is organized as follows:

IR_Project/
├── main_SOA.py
├── DataProcessing.py
├── Indexing.py
├── QueryProcessing.py
├── MatchingRanking.py
├── QueryRefinement.py
└── README.md
Each Python file corresponds to a specific service within the SOA architecture.

There are additional files that are used to complete the project:
├── Evaluation.py
├── APIs.py
├── ConvertToSCV.py
└──  DataRepresentation.py

## Future Improvements
Implement more advanced text processing techniques, such as named entity recognition and topic modeling.
Enhance the query refinement service by incorporating user feedback and learning from search history.
Explore more sophisticated ranking algorithms.
Implement scalability and fault-tolerance mechanisms to handle large-scale data and high traffic.

## Contributing
If you'd like to contribute to this project, please feel free to submit issues or pull requests. Contributions are always welcome!
