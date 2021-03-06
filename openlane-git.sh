while [ $# -gt 0 ]; do
  case "$1" in
    --rootPath=*)
      rootPath="${1#*=}"
      ;;
    *)
      printf "* Invalid argument Passed *"
      exit 1
  esac
  shift
done
mkdir openlane_working_dir
mkdir openlane_working_dir/pdks
export PDK_ROOT="$rootPath/openlane_working_dir/pdks"
export RUN_ROOT="$rootPath/openlane_working_dir/openlane"
export IMAGE_NAME=openlane:cloud
cd openlane_working_dir
git clone https://github.com/efabless/openlane.git --branch develop
cd openlane
make openlane
make skywater-pdk
make all-skywater-libraries
make open_pdks
docker run -it -v $RUN_ROOT:/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) openlane:cloud bash -c "make build-pdk"
