# knowledge-based-search-engine

## Retrieval-Augmented Generation (RAG) System

This project implements a **document-based question-answering system** using **semantic search** and **LLM-powered synthesis**. Users can upload PDFs, ask natural language questions, and receive answers grounded in document context.

---

## Objective

Enable intelligent search across multiple documents using:  
- Embeddings + FAISS for retrieval  
- LLM (FLAN-T5) for answer synthesis  

---

## Features

- Upload and parse PDF documents  
- Chunk text with overlap for semantic coverage  
- Embed chunks using `sentence-transformers`  
- Retrieve relevant chunks using FAISS  
- Synthesize answers using `google/flan-t5-small`  
- End-to-end pipeline in Google Colab  

---

## Quick Start (Google Colab)

1. Open `your_notebook_fixed.ipynb` in Google Colab.  
2. Upload your PDFs when prompted.  
3. Enter your query in the final cell.  
4. View retrieved chunks and synthesized answer.  

---

## Flutter Demo (Optional)

- A **minimal Flutter frontend** is included in `lib/main.dart`.  
- This demo allows you to **submit queries via a simple UI**.  
- **Note:** Core functionality resides in the Colab notebook and RAG backend; Flutter is only for demonstration.  
- To run the demo:
  1. Install Flutter and open the project in your IDE.  
  2. Run `lib/main.dart`.  
  3. Enter a query to see results displayed in the app.  

---

## System Components and Tools

- **Embedding model:** all-MiniLM-L6-v2 from SentenceTransformers  
- **Vector search:** FAISS with IndexFlatL2  
- **Language model (LLM):** google/flan-t5-small from Transformers  
- **PDF parsing:** PyPDF2  
- **Interface:** Google Colab notebook (core), Flutter (optional demo)  
