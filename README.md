# knowledge-based-search-engine
                                               
Retrieval-Augmented Generation (RAG) System:

This project implements a document-based question-answering system using **semantic search** and **LLM-powered synthesis**. Users can upload PDFs, ask natural language questions, and receive answers grounded in document context.


 Objective:

Enable intelligent search across multiple documents using:
-  Embeddings + FAISS for retrieval
-  LLM (FLAN-T5) for answer synthesis


Features:

-  Upload and parse PDF documents
-  Chunk text with overlap for semantic coverage
-  Embed chunks using `sentence-transformers`
-  Retrieve relevant chunks using FAISS
-  Synthesize answers using `google/flan-t5-small`
-  End-to-end pipeline in Google Colab


 Quick Start (Google Colab):
 
1. Run all cells sequentially in a colab notebook.
2 Upload your PDFs when prompted
3. Enter your query in the final cell
4. View retrieved chunks and synthesized answer

System Components and Tools 
The system is built using several key components and tools. The embedding model used is all-MiniLM-L6-v2 from SentenceTransformers, which converts text into numerical embeddings. For vector search, the system employs FAISS with the IndexFlatL2 index to efficiently find similar embeddings. The language model (LLM) utilized is google/flan-t5-small from Transformers, responsible for generating and understanding text. PDF parsing is handled using the PyPDF2 library to extract text from PDF documents. Finally, the entire interface and workflow are implemented in Google Colab for ease of experimentation and execution.



