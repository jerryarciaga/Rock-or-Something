# LayerOne 2025
## About the event
## Freebies!
### LayerOne Badge and Shirt
### Stickers

# CTF Events
There were two CTF Events that took place: a jeopardy-style CTF where you hack into infrastructure, inspect code or bypass security features to get a string that proves you pulled it off and a hardware CTF event called The Intercept. Sadly, my knowledge of hardware hacking is so limited, so I did not attempt this challenge. I also have to have the complete version of the badge

# Conference Talks
These are some notes I crudely taken from various presentations, there were actually a total of 12 talks that were preseneted and I only got to attend 3 of them.
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
The following walkthrough was based on the Ollama Project's [Documentation on GitHub](https://github.com/ollama/ollama?tab=readme-ov-file#customize-a-model).

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
Then, create and run the model:
```
ollama create mario -f ./Modelfile
ollama run mario
>>> hi
Hello! It's your friend Mario.
```
The rest of the demo focuses on running local LLMs and demonstrating use cases.
#### Key takeaways
* Local LLMs are not difficult to install and customize.
* Can be used by individuals and/or organizations for better privacy.
* Customization increases relevance, ROI.

## Covert Regional Communication with MeshTastic
This talk is presented by Daryll Strauss. This presentation will discuss the fundamentals of LORA radio and mesh networking, the capabilities of Meshtastic, the hardware choices for running Meshtastic, how to configure Meshtastic for secure communication
### US Radio Config
* 915mhz +/- 13mhz in the US
* Unlicensed band for industrial, scientific, and medical applications
* Low power
### Range
* Urban: 2-5 km
* Rural: 5-15 km
* Record: 1300 km
* Long way with line of sight
* 5 hops is ~50km for me
### SoCal
* Active in MeshTastic
* ~ 300 nodes between San Diego and Simi Valley
* Lots of chatter on LongFast
* https://socalmesh.org
### LORA Config
* Modem Preset
* Long fast is most popular
* Hop limit controls rebroadcasts
* Max 7 hops
### Device config
* Role controls what your node sends
* Rebroadcast mode controls how it handles
### Channels
* First is your default channel
* Long fast is unencrypted
### Covert client
* Create secure channel and remove LongFast
* Role: Client Hidden
* Limit hop count to requirement
* Rebroadcast: doesn't matter, not rebroadcasting
* Position: On or Off depending on application
* Heartbeat: Disabled (no extra blinking)
* Modem preset: probably longfast
* Consider stand-alone device (eg TDeck)
### Who/what is your threat?
* Opsec is hard
* Remember the panopticon
* Can they track cell phones?
* Can they radio locate?
* Who can see you use the device?
* Authenticate your users (clean on opsec)
### Meshtastic limitations
* NodeID is tied to bluetooth
* Data may be unreliable
* Data is small

## Hacking Toys into Robots
### Reverse imagineering
Start with the desired outcome, then go for how to get there.
### Bottango.com
An open source solution for making animatronic robots
* Configure Motors
* Add audio
* Move motors along a timeline
