module go.linka.cloud/libkv/store/boltdb/v2

go 1.15

require (
	github.com/stretchr/testify v1.7.0
	go.etcd.io/bbolt v1.3.5
	go.linka.cloud/libkv/v2 v2.0.0-00010101000000-000000000000
)
replace go.linka.cloud/libkv/v2 => ../..
