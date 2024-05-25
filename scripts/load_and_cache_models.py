from transformers import BertModel, AutoModel, AutoTokenizer

tokenizer = AutoTokenizer.from_pretrained("bert-base-cased")
tokenizer = AutoTokenizer.from_pretrained("bert-base-multilingual-cased")
model = AutoModel.from_pretrained("bert-base-cased")
model = AutoModel.from_pretrained("bert-base-multilingual-cased")


