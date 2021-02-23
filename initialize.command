RED="\033[0;31m"
GREEN="\033[0;32m"
EMPTY="\033[0m"

echo "${GREEN}React Native Project Creator Script\n\n${EMPTY}"

# CHECK NPX AND NPM

if command npx -v > /dev/null 2>&1
then 
    echo "${GREEN}npx is available...${EMPTY}"
else
    echo "${RED}npx command not found...${EMPTY}\nInstall npx globally using command: npm install npx -g"
    exit
fi

if command npm -v > /dev/null 2>&1
then 
    echo "${GREEN}npm is available...${EMPTY}"
else
    echo "${RED}npm command not found...${EMPTY}"
    exit
fi

echo "Project Name:"
read pname
if [ -z "$pname"  ]
then
    echo "${RED}Project name can not be empty!${EMPTY}"
    exit
fi

echo "React Native Version (press enter for latest):"
read pversion
if [$pversion -z ]
then
    echo "Initializing project... Please wait"
    npx react-native init $pname > /dev/null 2>&1
    echo "${GREEN}React Native Project initialized successfully... ${EMPTY}"
else
    echo "${GREEN}Project Name: ${pname}, React Native Version: ${pversion}${EMPTY}"
    echo "Initializing project... Please wait"
    npx react-native init $pname --version $pversion > /dev/null 2>&1
    echo "${GREEN}React Native Project initialized successfully... ${EMPTY}"
fi

cd $pname
echo "Project root directory:"
echo $pwd

echo "Install react-navigation(4x) with dependencies: (y/n)"
read rnav
if [ "$rnav" = "y" ] || [ "$rnav" = "Y" ]
then
    echo "Installing..."
    npm install react-navigation > /dev/null 2>&1
    echo "${GREEN}react-navigation installed...${EMPTY}"
    npm install react-navigation-stack > /dev/null 2>&1
    echo "${GREEN}react-navigation-stack installed...${EMPTY}"
    npm install react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view > /dev/null 2>&1
    echo "${GREEN}react-native-reanimated installed...${EMPTY}"
    echo "${GREEN}react-native-gesture-handler installed...${EMPTY}"
    echo "${GREEN}react-native-screens installed...${EMPTY}"
    echo "${GREEN}react-native-safe-area-context installed...${EMPTY}"
    echo "${GREEN}@react-native-community/masked-view installed...${EMPTY}"
fi

echo "Install i18n-js and react-native-localize: (y/n)"
read rlocal
if [ "$rlocal" = "y" ] || [ "$rlocal" = "Y" ]
then
    echo "Installing..."
    npm install i18n-js > /dev/null 2>&1
    echo "${GREEN}i18n-js installed...${EMPTY}"
    npm install react-native-localize > /dev/null 2>&1
    echo "${GREEN}react-native-localize installed...${EMPTY}"
fi

echo "Install redux, react-redux and react-persist: (y/n)"
read rredux
if [ "$rredux" = "y" ] || [ "$rredux" = "Y" ]
then
    echo "Installing..."
    npm install redux react-redux react-persist > /dev/null 2>&1
    echo "${GREEN}redux installed...${EMPTY}"
    echo "${GREEN}react-redux installed...${EMPTY}"
    echo "${GREEN}react-persist installed...${EMPTY}"
fi

echo "Install lodash: (y/n)"
read rlodash
if [ "$rlodash" = "y" ] || [ "$rlodash" = "Y" ]
then
    echo "Installing..."
    npm install lodash > /dev/null 2>&1
    echo "${GREEN}lodash installed...${EMPTY}"
fi

echo "Install moment: (y/n)"
read rmoment
if [ "$rmoment" = "y" ] || [ "$rmoment" = "Y" ]
then
    echo "Installing..."
    npm install rmoment > /dev/null 2>&1
    echo "${GREEN}rmoment installed...${EMPTY}"
fi

echo "Installing Pods..."
cd ios
cd pod install > /dev/null 2>&1
echo "${GREEN}Pods installed...${EMPTY}"
cd ..

echo "trying to open Visual Studio Code..."
if code . > /dev/null 2>&1
then 
    echo "opening Visual Studio Code..."
else 
    echo "go to https://code.visualstudio.com/docs/setup/mac for setting up Visual Studio Code"
fi



