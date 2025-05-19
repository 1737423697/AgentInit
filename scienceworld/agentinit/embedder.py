from transformers import AutoTokenizer, AutoModel
import numpy as np
import torch
import torch.nn.functional as F
from typing import List, Union

class Embedder:
    def __init__(self, model_path: str = ''):

        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        self.tokenizer = AutoTokenizer.from_pretrained(model_path)
        self.model = AutoModel.from_pretrained(model_path).to(self.device)
        self.model.eval() 

    def _mean_pooling(self, model_output: torch.Tensor, attention_mask: torch.Tensor) -> torch.Tensor:

        token_embeddings = model_output[0]  # First element contains all token embeddings
        input_mask_expanded = attention_mask.unsqueeze(-1).expand(token_embeddings.size()).float()
        return torch.sum(token_embeddings * input_mask_expanded, 1) / torch.clamp(input_mask_expanded.sum(1), min=1e-9)

    def embed_sentences(self, sentences: Union[str, List[str]], batch_size: int = 32) -> np.ndarray:

        if isinstance(sentences, str):
            sentences = [sentences]

        all_embeddings = []
        for i in range(0, len(sentences), batch_size):
            batch = sentences[i:i + batch_size]
            
            encoded_input = self.tokenizer(
                batch, 
                padding=True, 
                truncation=True, 
                return_tensors='pt'
            ).to(self.device)

            with torch.no_grad():
                model_output = self.model(**encoded_input)

            embeddings = self._mean_pooling(model_output, encoded_input['attention_mask'])
            embeddings = F.normalize(embeddings, p=2, dim=1)
            
            all_embeddings.append(embeddings.cpu().numpy())

        return np.concatenate(all_embeddings, axis=0)

    @staticmethod
    def cosine_similarity(embeddings: np.ndarray, normalize: bool = True) -> np.ndarray:
        if normalize:
            embeddings = embeddings / np.linalg.norm(embeddings, axis=1, keepdims=True)
        return np.dot(embeddings, embeddings.T)

    @staticmethod
    def cosine_similarity_query(query: np.ndarray, embeddings: np.ndarray, normalize: bool = True) -> np.ndarray:
        if normalize:
            embeddings = embeddings / np.linalg.norm(embeddings, axis=1, keepdims=True)
            query = query / np.linalg.norm(query) 

        return np.dot(embeddings, query.T).flatten()
