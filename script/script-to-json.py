# This scripts generates a valid StoryDescription.JSON to be used with BOken Engine, using a markdown script as a source
import re
inputFile = open("storyboard_v01.md", "r")
content = inputFile.read()
content = re.sub("\# Scene:(?P<id>.+)\n(?P<elements>(.+\n(?!\# Scene))+(.*\n)?)", "{\n    \"sceneId\":\"\g<id>\",\n    \"elements\": {\"elementsArray\": [\n\g<elements>    ]},\n    \"navigation\": \"none\"\n},\n\n\n", content,0,flags=re.I|re.M|re.U);
inputFile.close()
outputFile = open("storyDescription.json", "w")
outputFile.write("""{
    "appTitle": "Iakkai Saga - The Curse of Blood",
    "backgroundMusic": "backmusic",
    "scenes": [""")    
content = re.sub("Sprite: *None *<br>\n?", "", content,0,flags=re.I|re.M|re.U);    
content = re.sub("## Title: .*  &nbsp;\n?", "", content,0,flags=re.I|re.M|re.U);    
content = re.sub(" *Title: .*\n?", "", content,0,flags=re.I|re.M|re.U);    
content = re.sub("- Option:  \[Next\]\(.*\) *\n?", "", content,0,flags=re.I|re.M|re.U); 
content = re.sub(" *Background: (?P<imageFile>.*)\n", """
                {
                    "type": "image",
                    "imageFile": "\g<imageFile>",
                    "posX": 0,
                    "posY": 0,
                    "scale": 0
                },                
""", content,0,flags=re.I|re.M|re.U); 
content = re.sub(" *Sprite: (?P<imageFile>.*)\n", """
                {
                    "type": "image",
                    "imageFile": "\g<imageFile>",
                    "posX": 0,
                    "posY": 0,
                    "scale": 0
                },                
""", content,0,flags=re.I|re.M|re.U); 
content = re.sub(" *Text: (?P<content>.*)\n", """
                {
                    "type": "textLabel",
                    "content": "\g<content>",
                    "posX": 0.5,
                    "posY": 0.5,
                    "fontSize": 30
                },                
""", content,0,flags=re.I|re.M|re.U); 
outputFile.write(content);
outputFile.write("""    ]
    }""")          
outputFile.close()