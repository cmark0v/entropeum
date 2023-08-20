pragma solidity ^0.8.21;

library Rand {
    function rand32() external view returns (uint32) {
        uint32 h = 0x811c9dc5;
        uint32 hmu = ((1 << 24) + (1 << 8) + 0x93);
        unchecked {
            h = h * hmu;
            h = uint32(block.prevrandao & 0xff) ^ h;
            h = h * hmu;
            h = uint32(block.timestamp & 0xff) ^ h;
            h = h * hmu;
            h = uint32(block.number & 0xff) ^ h;
            h = h * hmu;
            h = uint32(gasleft() & 0xff) ^ h;
            h = h * hmu;
            h = uint32((block.prevrandao%8888) & 0xff) ^ h;
        }
        return h;
    }

    function rand64() external view returns (uint64) {
        uint64 h = 0xcbf29ce484222325;
        uint64 hmu = ((1 << 40) + (1 << 8) + 0xb3);
        unchecked {
            h = h * hmu;
            h = uint64(block.prevrandao & 0xff) ^ h;
            h = h * hmu;
            h = uint64(block.timestamp & 0xff) ^ h;
            h = h * hmu;
            h = uint64(block.number & 0xff) ^ h;
            h = h * hmu;
            h = uint64(tx.gasprice & 0xff) ^ h;
            h = h * hmu;
            h = uint64((gasleft()%3333) & 0xff) ^ h;
            h = h * hmu;
            h = uint64((block.timestamp >> 8) & 0xff) ^ h;
            h = h * hmu;
            h = uint64(block.basefee & 0xff) ^ h;
            h = h * hmu;
            h = uint64(gasleft() & 0xff) ^ h;
        }
        return h;
    }

    function rand256() external view returns (uint256) {
        uint256 h = 0xdd268dbcaac550362d98c384c4e576ccc8b1536847b6bbb31023b4c8caee0535;
        uint256 hmu = ((1 << 88) + (1 << 8) + 0x3b);
        unchecked {
            for (uint8 j = 0; j < 4; j++) {
                h = h * hmu;
                h = uint256((block.prevrandao >> (8 * j)) & 0xff) ^ h;
                h = h * hmu;
                h = uint256((block.timestamp >> (8 * j)) & 0xff) ^ h;
                h = h * hmu;
                h = uint256((block.number >> (8 * j)) & 0xff) ^ h;
                h = h * hmu;
                h = uint256((tx.gasprice >> (8 * j)) & 0xff) ^ h;

                h = h * hmu;
                h = uint256((gasleft() >> (8 * j)) & 0xff) ^ h;
                h = h * hmu;
                h = uint256((block.timestamp >> (8 * (j + 1))) & 0xff) ^ h;
                h = h * hmu;
                h = uint256((block.basefee >> (8 * j)) & 0xff) ^ h;
                h = h * hmu;
                h = uint256((gasleft() >> (8 * j)) & 0xff) ^ h;
            }
        }
        return h;
    }

    function kek256() external view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        tx.gasprice,
                        block.prevrandao,
                        block.timestamp,
                        block.number,
                        gasleft(),
                        block.basefee
                    )
                )
            );
    }
}
