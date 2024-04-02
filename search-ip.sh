
while getopts n: flag
do
    case "${flag}" in
        n) name=${OPTARG};;
        # 
    esac
done

ifconfig $name &> /dev/null
NAME_STATUS=$?

if test $NAME_STATUS -ne 0
then
    echo "La interfaz $name no existe"

    exit 0
fi

ip=$(ifconfig $name 2> /dev/null | grep 'inet ' | awk '{print $2}');

if [[ -z "$ip" ]];
then
    echo "$name no tiene ip"

    exit 0
fi

echo $ip

