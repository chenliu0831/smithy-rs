$version: "2.0"

namespace com.benchmark

use aws.protocols#restJson1
use smithy.rust#serde

@restJson1
@serde
service BenchmarkService {
    operations: [GetBenchmarkRecord]
}

@http(uri: "/benchmark", method: "GET")
@serde
operation GetBenchmarkRecord {
    output: BenchmarkRecordOutput
}

structure BenchmarkRecordOutput {
    @httpPayload
    record: BenchmarkRecord
}

@serde
structure BenchmarkRecord {
    @required
    id: String

    @required
    name: String

    description: String

    @required
    category: String

    @required
    price: Double

    @required
    quantity: Integer

    rating: Float

    @required
    isAvailable: Boolean

    @required
    createdAt: Long

    updatedAt: Long

    tags: TagList

    attributes: AttributeMap

    metadata: RecordMetadata

    relatedIds: IdList

    scores: ScoreList
}

@serde
structure RecordMetadata {
    @required
    version: String

    @required
    source: String

    checksum: String

    priority: Integer

    weight: Double

    flags: FlagList
}

list TagList {
    member: String
}

list IdList {
    member: String
}

list ScoreList {
    member: Double
}

list FlagList {
    member: Boolean
}

map AttributeMap {
    key: String
    value: String
}
