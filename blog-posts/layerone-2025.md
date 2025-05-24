# LayerOne 2025

# Conference Talks
## Hosting your own AI
### What is AI?
* AI is a vast computer science branch aimed at creating systems to perform tasks requiring human intelligence
* AI includes
    * Robotics
    * Computer Vision
    * Natural Language Processing (NLP) - help computers understand human language (Remember, computers only understand bits and bytes)
### Where do LLMs fit in AI?
* Large language models (LLMs) are a subset of generative AI
* Text based
* Probabilistic - think search suggestions
* Current model
### Why go local?
* Privacy and Security
    * No data leaves your machine/network/intranet
* Customization
    * Fine-tune for your needs - create custom models
### Cybersecurity concerns about LLMs
    * Jailbreaking and prompt injection
    * Data leakage and Privacy risks
    * Model Bias and Poisoning
    * Social engineering automation
### Components to build a Local LLM
#### Hardware
* GPUs speed processing, but not 100% necessary
* RAM and Disk Space: 16+ GB RAM, 50GB + disk space
#### Software
* Determines UI, model management, other capabilities
* Ollama
    * Command line interface, but you can also tie it to a GUI.
* Misty
    * Graphic user interface (GUI), developed by CloudStack LLC
    * Pulls models from Ollama, Hugging Face
    * Takes APIs from OpenAI, Claude, Google, Perplexity and more!
### Choosing and LLM Model
LLM Naming conventions are as follows:
* Base Name = Core model name
* Version Number
* Parameter Count
* Training type
* Additional Modifiers
### Demo
#### Installing Ollama
* Head to [Ollam's Download Page](https://ollama.com/download), then copy and paste the following script to your terminal: 'curl -fsSL https://ollama.com/install.sh | sh`. To run and chat with [Llama 3.2](https://ollama.com/library/llama3.2), run the following command:
```
ollama run llama3.2
```
#### Customizing a prompt
To customize a model, such as llama3.2, do a `ollama pull llama3.2`, then create a `ModelFile`.
```
FROM llama3.2

# set the temperature to 1 [higher is more creative, lower is more coherent]
PARAMETER temperature 1

# set the system message
SYSTEM """
You are Mario from Super Mario Bros. Answer as Mario, the assistant, only.
"""
```
